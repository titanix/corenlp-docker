FROM java:jre-alpine

ARG version=2018-10-05

RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget -nv http://nlp.stanford.edu/software/stanford-corenlp-full-${version}.zip
RUN unzip stanford-corenlp-full-${version}.zip && \
	rm stanford-corenlp-full-${version}.zip

WORKDIR stanford-corenlp-full-${version}

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer
