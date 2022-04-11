# preston-dillen-2018

This repository provides a way to track the image corpus and associated metadata as described by [1]:

Dillen Mathias. (2018). A benchmark dataset of herbarium specimen images with label data: Summary [Data set]. Zenodo. https://doi.org/10.5281/zenodo.6372393

and related data paper [2]:

Dillen M, Groom Q, Chagnoux S, Güntsch A, Hardisty A, Haston E, Livermore L, Runnel V, Schulman L, Willemse L, Wu Z, Phillips S (2019) A benchmark dataset of herbarium specimen images with label data. Biodiversity Data Journal 7: e31817. https://doi.org/10.3897/BDJ.7.e31817

and associated publications using [Preston](https://preston.guoda.bio) [3], a biodiversity dataset tracker. 

:warning: this is an experimental data repository :warning: 

## contents

```README.md``` - this file

```build.sh``` - script that tracks the image dataset and creates associated products like index.json

```data/``` - a preston data archive consisting of the summary csv and associated data

```index.json``` - a json-ld presentation of specimen metadata, generated by build.sh

```preston.jar``` - Preston v0.3.6 jar retrieved from https://github.com/bio-guoda/preston/releases/download/0.3.6/preston.jar on 2022-04-11.

```thumbnail.jpg``` - an example plant specimen image thumbnail derived from https://zenodo.org/record/1484146/files/E00633257.tif Royal Botanic Garden Edinburgh. (2018). Herbarium specimen image of Abelia forrestii (Diels) W.W.Sm., part of the collection of Royal Botanic Garden Edinburgh. Zenodo. https://doi.org/10.5281/zenodo.1484146 . http://data.rbge.org.uk/herb/E00633257 [4].

## usage


### update

to update the data associated with the Dillen 2018 corpus, install Preston (>= v0.3.6), jq, and re-run:

```shell
./build.sh 
```

Depending on your network connectivity and Zenodo server response times, this process may take a while. If you'd rather work with a pre-compiled version, please skip to the next section: [clone](#clone). 

### clone
To work with a previously captured version of the image corpus (and it's associated images) locally, suggest to run:

```shell
preston clone --algo md5 --remote https://raw.githubusercontent.com/bio-guoda/preston-dillen-2018/main/data,https://zenodo.org,https://archive.org/download/herbarium-specimen-images-dillen-2018/data.zip/data
```

Please note that the associated (heavy) images are stored in [Zenodo](https://doi.org/10.5281/zenodo.6372393) and the [Internet Archive](https://archive.org/details/herbarium-specimen-images-dillen-2018), whereas (lightweight) indexes, metadata and json snippets can be retrieved from this repository via https://raw.githubusercontent.com/bio-guoda/preston-dillen-2018/main/data (a webview onto this repository) or by cloning the repo locally using git. The latter is much faster because git is pretty good getting many files from a remote location. Also, note that downloading the >200GB corpus may take a while depending on your internet connection speed or the load on Zenodo's valuable web services.   

If all goes well, you should have a data folder that contains just over 200G in data:

```
$ du -d1 -h 
203G	./data
203G	.
```

### find 

You can use the generated index.json to find the specimen records that you are interested in. 

For instance, you can use jq in combination with ```head``` to find the first 2 specimen record of genus ```Abelia``` 

```shell
cat index.json\
| jq --compact-output '.["@graph"][] | select(.["dwc:genus"] == "Abelia")'\
| head -n2\
| jq .
```

with expected output:

```json
{
  "dwc:basisOfRecord": "PRESERVED_SPECIMEN",
  "dwc:scientificName": "Abelia forrestii (Diels) W.W.Sm.",
  "dwc:taxonRank": "SPECIES",
  "dwc:countryCode": "CN",
  "dwc:occurrenceID": "http://data.rbge.org.uk/herb/E00633257",
  "dwc:catalogNumber": "E00633257",
  "dwc:genus": "Abelia",
  "dwc:specificEpithet": "forrestii",
  "dwc:country": "China",
  "setID": "E",
  "dcterms:identifier": "http://data.rbge.org.uk/herb/E00633257",
  "dcterms:modified": "2013-01-08",
  "dwc:otherCatalogNumbers": "BGBASE:645427",
  "dwc:collectionID": "http://biocol.org/urn:lsid:biocol.org:col:15670",
  "dwc:kingdom": "Plantae",
  "dwc:phylum": "Tracheophyta",
  "dwc:order": "Dipsacales",
  "dwc:family": "Caprifoliaceae",
  "dwc:class": "Magnoliopsida",
  "dwc:collectionCode": "E",
  "dwc:nomenclaturalCode": "ICBN",
  "dwc:institutionCode": "E",
  "dwc:higherGeography": "Inner China, Korea and Taiwan",
  "dwc:preparations": "herbarium specimen of unspecified type",
  "dc:type": "PhysicalObject",
  "dwc:datasetName": "Royal Botanic Garden Edinburgh Herbarium",
  "dwc:verbatimCoordinateSystem": "degrees minutes seconds",
  "dwc:ownerInstitutionCode": "E",
  "dcterms:language": "eng",
  "@id": "http://data.rbge.org.uk/herb/E00633257",
  "@type": "dwc:Occurrence"
}
{
  "dwc:basisOfRecord": "PRESERVED_SPECIMEN",
  "dwc:scientificName": "Abelia R.Br.",
  "dwc:taxonRank": "GENUS",
  "dwc:countryCode": "CN",
  "dwc:occurrenceID": "http://data.rbge.org.uk/herb/E00289691",
  "dwc:catalogNumber": "E00289691",
  "dwc:genus": "Abelia",
  "dwc:country": "China",
  "dwc:year": 2006,
  "dwc:eventDate": "2006-05-29",
  "dwc:locality": "Danzha Cun. In the vicinity of Zhaobitan forest farm, ca. 26.5 direct km NNW of Houqiao (Guyong).",
  "dwc:recordedBy": "Gaoligong Shan Biotic Survey Expedition - Summer 2006",
  "dwc:decimalLatitude": 25.5433,
  "dwc:decimalLongitude": 98.2222,
  "dwc:geodeticDatum": "WGS84",
  "setID": "E",
  "dwc:verbatimEventDate": "2006-05-29",
  "dwc:stateProvince": "Yunnan",
  "dcterms:identifier": "http://data.rbge.org.uk/herb/E00289691",
  "dwc:month": 5,
  "dwc:day": 29,
  "dwc:county": "Tengchong",
  "dcterms:modified": "2008-11-05",
  "dwc:recordNumber": "30809",
  "dwc:verbatimElevation": "2630 M",
  "dwc:otherCatalogNumbers": "BGBASE:299189",
  "dwc:collectionID": "http://biocol.org/urn:lsid:biocol.org:col:15670",
  "dwc:kingdom": "Plantae",
  "dwc:phylum": "Tracheophyta",
  "dwc:order": "Dipsacales",
  "dwc:family": "Caprifoliaceae",
  "dwc:class": "Magnoliopsida",
  "dwc:collectionCode": "E",
  "dwc:nomenclaturalCode": "ICBN",
  "dwc:institutionCode": "E",
  "dwc:occurrenceRemarks": "felling",
  "dwc:higherGeography": "Inner China, Korea and Taiwan",
  "dwc:startDayOfYear": 149,
  "dwc:preparations": "herbarium specimen of unspecified type",
  "dc:type": "PhysicalObject",
  "dwc:datasetName": "Royal Botanic Garden Edinburgh Herbarium",
  "dwc:elevation": 2630,
  "dwc:elevationAccuracy": 0,
  "dwc:fieldNotes": "Shrub less than 1.5 m tall. Flowers whitish yellow. Forest dominated by Lithocarpus. Growing in forest in shade.",
  "dwc:verbatimCoordinateSystem": "degrees minutes seconds",
  "dwc:ownerInstitutionCode": "E",
  "dcterms:language": "eng",
  "@id": "http://data.rbge.org.uk/herb/E00289691",
  "@type": "dwc:Occurrence"
}
```

would select all available specimen records. 


### image processing

Now, select some tiff images using:

```
preston ls --algo md5 -l tsv\
| grep hasVersion\
| grep tif\
| cut -f3\
| grep hash://\
| head
 ```

 produces:

```
hash://md5/a5ccffe5fe22aca505acdaf41c42906b
hash://md5/b35348aa71090a1f80e9d3fe8def8371
hash://md5/37fde5ff1d29e2f21fdb6bcfaef2fe19
hash://md5/56407fa802d0189b9b69f24b30d0242b
hash://md5/349696f3a0fda2ceb798fabfdb367262
hash://md5/0eb416c5561818003c37c211691fb455
hash://md5/9029736abb31c1f01646cd5d41d55c8d
hash://md5/9c0fddd7529d5d114bb716dac40106be
hash://md5/96d0349faf932032f43a7e90ec73ab3e
hash://md5/00127099bf5e2035ad76b45979ca5504
```

These are hashes (or content ids) associated with tracked tiff images. 

Extract one TIFF image into a file using Zenodo as a remote image repository (i.e. ```--remote https://zenodo.org```) without caching a local copy (i.e. ```---no-cache```) :  

```
preston cat --algo md5 hash://md5/a5ccffe5fe22aca505acdaf41c42906b --remote https://zenodo.org --no-cache > some.tiff
```

and open the large image file (> 100MB) in your favorite images processing program, or process it futher.

Alternatively, you can use the Internet Archive as a remote image repository by:

```
preston cat --algo md5 hash://md5/a5ccffe5fe22aca505acdaf41c42906b --remote https://archive.org/download/herbarium-specimen-images-dillen-2018/data.zip/data --no-cache > some.tiff
```

or, if you'd like define the two remote image repositories in a single command using ```--remote https://example.org/,https://example.org``` syntax. In the example below, Preston would first try Zenodo, then the Internet Archive location, to resolve the content with id hash://md5/a5ccffe5fe22aca505acdaf41c42906b

```
preston cat --algo md5 hash://md5/a5ccffe5fe22aca505acdaf41c42906b --remote https://zenodo.org,https://archive.org/download/herbarium-specimen-images-dillen-2018/data.zip/data --no-cache > some.tiff
```

Note that this uses Zenodo to lookup the image by their md5 hash (for background, see https://github.com/bio-guoda/preston/issues/149). In other words, Preston asks for content with a specific content hash, and Zenodo finds one if it has it.

Also note that this ```preston cat ...``` example above would work anywhere as long as: (1) you have an internet connection (2) Zenodo is up and running, and (3) installed a version of Preston. 

### image processing: creating a thumbnail

Now that you can _stream_ data from your image corpus, you could generate a thumbnail ```thumbnail.jpg``` using Imagemagick's convert, Preston, and the first tif image found in the Dillen 2018 Herbarium corpus:

```
preston ls --algo md5\
| grep hasVersion\
| grep "\.tif"\
| head -n1\
| preston cat --remote https://zenodo.org --no-cache --algo md5\
| convert tiff:- -thumbnail 120x90 thumbnail.jpg
```

This example can be extended to include *all* images in the corpus with *any* command-line image processing tool (e.g., tesseract, automl, opencv). And, optionally, you can add the thumbnail into the preston archive, and associate them with Prov's http://www.w3.org/ns/prov#wasDerivedFrom relation.

See the thumbnail.jpg derived from [4] below for resulting thumbnail.

![http://data.rbge.org.uk/herb/E00633257](https://github.com/bio-guoda/preston-dillen-2018/blob/main/thumbnail.jpg?raw=true)


# References

[1] Dillen Mathias. (2018). A benchmark dataset of herbarium specimen images with label data: Summary [Data set]. Zenodo. https://doi.org/10.5281/zenodo.6372393

[2] Dillen M, Groom Q, Chagnoux S, Güntsch A, Hardisty A, Haston E, Livermore L, Runnel V, Schulman L, Willemse L, Wu Z, Phillips S (2019) A benchmark dataset of herbarium specimen images with label data. Biodiversity Data Journal 7: e31817. https://doi.org/10.3897/BDJ.7.e31817

[3] MJ Elliott, JH Poelen, JAB Fortes (2020). Toward Reliable Biodiversity Dataset References. Ecological Informatics. https://doi.org/10.1016/j.ecoinf.2020.101132

[4] Royal Botanic Garden Edinburgh. (2018). Herbarium specimen image of Abelia forrestii (Diels) W.W.Sm., part of the collection of Royal Botanic Garden Edinburgh. Zenodo. https://doi.org/10.5281/zenodo.1484146 . http://data.rbge.org.uk/herb/E00633257
