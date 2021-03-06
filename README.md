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

with the following version / provenance / hash identifiers describing the dataset:

```
$ preston history --algo md5
<urn:uuid:0659a54f-b713-4f86-a917-5be166a14110> <http://purl.org/pav/hasVersion> <hash://md5/c07addfcbb5b8711da6e3da4e9a50481> .
<hash://md5/3cf86993aeb3d6deec14423af63dd4ac> <http://purl.org/pav/previousVersion> <hash://md5/c07addfcbb5b8711da6e3da4e9a50481> .
<hash://md5/df8083ceb1c45410a6382550a6f8fefe> <http://purl.org/pav/previousVersion> <hash://md5/3cf86993aeb3d6deec14423af63dd4ac> .
<hash://md5/dfd76204ef0ac239b596c65eb07879cf> <http://purl.org/pav/previousVersion> <hash://md5/df8083ceb1c45410a6382550a6f8fefe> .
<hash://md5/3a0765ad1b60bd0f08f4b5cba1908a11> <http://purl.org/pav/previousVersion> <hash://md5/dfd76204ef0ac239b596c65eb07879cf> .
<hash://md5/882fbfbd7ea8a7f4cfe26c3b35de44f5> <http://purl.org/pav/previousVersion> <hash://md5/3a0765ad1b60bd0f08f4b5cba1908a11> .
<hash://md5/f64dc1613e3ab43d64ebf8ca0a26a3e6> <http://purl.org/pav/previousVersion> <hash://md5/882fbfbd7ea8a7f4cfe26c3b35de44f5> .
<hash://md5/9f5dfdf6eec79fff6dbf11cb5d7d1cba> <http://purl.org/pav/previousVersion> <hash://md5/f64dc1613e3ab43d64ebf8ca0a26a3e6> .
<hash://md5/ff885e9653ef6c23511b72dfbe0eba24> <http://purl.org/pav/previousVersion> <hash://md5/9f5dfdf6eec79fff6dbf11cb5d7d1cba> .
<hash://md5/272ea5431b9e3d7a6274684ef99cbd9c> <http://purl.org/pav/previousVersion> <hash://md5/ff885e9653ef6c23511b72dfbe0eba24> .
<hash://md5/cad7bd4421ce0acf585098c2e122d70f> <http://purl.org/pav/previousVersion> <hash://md5/272ea5431b9e3d7a6274684ef99cbd9c> .
<hash://md5/c889d083a2d0ba1337d2bfb080a333ad> <http://purl.org/pav/previousVersion> <hash://md5/cad7bd4421ce0acf585098c2e122d70f> .
<hash://md5/2dbeff0b55db59f51ffd2f7a8a641169> <http://purl.org/pav/previousVersion> <hash://md5/c889d083a2d0ba1337d2bfb080a333ad> .
<hash://md5/ee30b0fd4b019b2b9a7553a17c6537c2> <http://purl.org/pav/previousVersion> <hash://md5/2dbeff0b55db59f51ffd2f7a8a641169> .
<hash://md5/0103ec2541a148c79237144da5e34afd> <http://purl.org/pav/previousVersion> <hash://md5/ee30b0fd4b019b2b9a7553a17c6537c2> .
<hash://md5/9921568355e467b6f1c2ca2f21730b30> <http://purl.org/pav/previousVersion> <hash://md5/0103ec2541a148c79237144da5e34afd> .
<hash://md5/04073a68f963e3e7051bdc67c13c85f6> <http://purl.org/pav/previousVersion> <hash://md5/9921568355e467b6f1c2ca2f21730b30> .
<hash://md5/af22f5f9ad14cf542fa6b8ac2e1f8911> <http://purl.org/pav/previousVersion> <hash://md5/04073a68f963e3e7051bdc67c13c85f6> .
<hash://md5/06674c38ecb7ba1d650123d65adece16> <http://purl.org/pav/previousVersion> <hash://md5/af22f5f9ad14cf542fa6b8ac2e1f8911> .
<hash://md5/6d237cf6801f0687722e19551dd7ae03> <http://purl.org/pav/previousVersion> <hash://md5/06674c38ecb7ba1d650123d65adece16> .
<hash://md5/39341df2ac85327498a87c57243109a9> <http://purl.org/pav/previousVersion> <hash://md5/6d237cf6801f0687722e19551dd7ae03> .
<hash://md5/867860e02b2f5d5892e07125ff3979c0> <http://purl.org/pav/previousVersion> <hash://md5/39341df2ac85327498a87c57243109a9> .
<hash://md5/aa08a8968a0907a0d473710d274c8cb9> <http://purl.org/pav/previousVersion> <hash://md5/867860e02b2f5d5892e07125ff3979c0> .
<hash://md5/24d20067e22238b761e726cc6f80453e> <http://purl.org/pav/previousVersion> <hash://md5/aa08a8968a0907a0d473710d274c8cb9> .
<hash://md5/2d1fcfe8666031a4d2fd5c78d516ac64> <http://purl.org/pav/previousVersion> <hash://md5/24d20067e22238b761e726cc6f80453e> .
<hash://md5/4d6b606aa921a6a699ad3e3792b59722> <http://purl.org/pav/previousVersion> <hash://md5/2d1fcfe8666031a4d2fd5c78d516ac64> .
<hash://md5/6b06d3e21f13afe20a3785a533ab8b8f> <http://purl.org/pav/previousVersion> <hash://md5/4d6b606aa921a6a699ad3e3792b59722> .
<hash://md5/8bdfdcf54862db47f7f2baf878550833> <http://purl.org/pav/previousVersion> <hash://md5/6b06d3e21f13afe20a3785a533ab8b8f> .
<hash://md5/eafad91644074f5ce6ef4f9d4f5b4308> <http://purl.org/pav/previousVersion> <hash://md5/8bdfdcf54862db47f7f2baf878550833> .
<hash://md5/fd03eade4bcf6f306aad5fdb67838dfb> <http://purl.org/pav/previousVersion> <hash://md5/eafad91644074f5ce6ef4f9d4f5b4308> .
<hash://md5/cb2acbcc55bdcda0541135529eeb2b9e> <http://purl.org/pav/previousVersion> <hash://md5/fd03eade4bcf6f306aad5fdb67838dfb> .
<hash://md5/76287abcf23de3e0b5ed7a18d2c28adc> <http://purl.org/pav/previousVersion> <hash://md5/cb2acbcc55bdcda0541135529eeb2b9e> .
<hash://md5/f55f8f9877170ade28a14740be4c34d1> <http://purl.org/pav/previousVersion> <hash://md5/76287abcf23de3e0b5ed7a18d2c28adc> .
<hash://md5/13bb5c5b6c85a3a4d59dac77965184f9> <http://purl.org/pav/previousVersion> <hash://md5/f55f8f9877170ade28a14740be4c34d1> .
<hash://md5/68b04e71c97f76331b65d03c0f734c41> <http://purl.org/pav/previousVersion> <hash://md5/13bb5c5b6c85a3a4d59dac77965184f9> .
<hash://md5/721e8329e1cdffa06398bc5214a14d3e> <http://purl.org/pav/previousVersion> <hash://md5/68b04e71c97f76331b65d03c0f734c41> .
<hash://md5/332db3767562e20b399949cd39027e61> <http://purl.org/pav/previousVersion> <hash://md5/721e8329e1cdffa06398bc5214a14d3e> .
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
