#!/bin/bash
#
# indexes Dillen Image Corpus as published in:
#
#  Dillen Mathias. (2018). A benchmark dataset of herbarium specimen images with label data: Summary [Data set]. Zenodo. https://doi.org/10.5281/zenodo.6372393
#
#
# Dependencies:
#  preston > v0.3.5
#  jq
#  posix tools like grep, cut, and tail
#


#### creating a corpus on Zenodo 

#### using a corpus published through Zenodo

# get meise index
preston track --algo md5 "https://zenodo.org/record/6372393/files/Data%20and%20Links%20excl%20extensions.csv"

# find the referenced json urls
preston ls --algo md5\
| preston grep -o --no-line --algo md5 "https://zenodo[^ ,]+.json"\
| preston append --algo md5

# track the captured json urls
preston ls -l tsv --algo md5\
 | grep "prov#value"\
 | cut -f3\
 | xargs -L100 preston track --algo md5

# cat the captures json content, as described in the track
preston ls --algo md5\
 | grep -E ".json>"\
 | preston cat --algo md5\
 | jq --compact-output . > index.json

 # now index the associated tiff images
preston history --algo md5\
 | head -n1\
 | preston cat --algo md5\
 | preston cat --algo md5\
 | mlr --csv cut -f tiffURL\
 | tail -n+2\
 | grep http\
 | xargs -L100 preston track --no-cache --algo md5

