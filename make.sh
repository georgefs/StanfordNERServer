#!/bin/bash
mkdir -p service/impl
mkdir -p service/endp

javac -cp . NerService.java
mv -f NerService.class service/impl/

javac -cp . NerServiceImpl.java
mv -f NerServiceImpl.class service/impl/

javac NerServicePublisher.java
mv -f NerServicePublisher.class service/endp/
