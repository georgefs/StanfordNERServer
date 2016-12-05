# Stanford NER Server

## Introduction

NER(Name Entity Recognition)是指辨識各單詞是否為專有名詞，如人名、地名、組織名等等。
因為[Stanford NER](http://nlp.stanford.edu/software/CRF-NER.shtml)是用Java寫的，用Python存取不方便，所以寫了這個wrapper，將其包裝成一個service。

## Installation

```shell-script
git clone https://github.com/banyh/StanfordNERServer
cd StanfordNERServer
sh install.sh
```

確定你有安裝Java SDK 8，然後執行`run.sh`，這樣service就啟動了。當第一次呼叫service時，會載入資料，所以會花較長時間。


## Customization

1. NER支援的語言model定義在`NerServiceImpl.java`第42行，當文字中ASCII字元的數量超過70%時，視為英文，會使用model `english.muc.7class.distsim.crf.ser.gz`；若不是英文，則視為中文，會使用model `chinese.misc.distsim.crf.ser.gz`。
2. Port number定義在`NerServicePublisher.java`第10行，預設值為`http://localhost:9996/ner`


## Usage

1. 在Python中安裝`suds`套件
    * 在Python2可以用`pip install suds`
    * 在Python3可以用`pip3 install suds-py3`
2. 建立一個SOAP Client，就可以使用Stanford segmenter了
    * `from suds.client import Client`
    * `nerClient = Client('http://localhost:9996/ner?wsdl')`
    * `nerClient.service.getNerResult(text)`
3. 注意事項
    * Stanford NER的訓練資料是簡體，所以使用繁體時效果會較差，建議將文字轉為簡體
