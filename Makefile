#! make

build:
	docker build -t shiny-auth0 -f Dockerfile .

test-shell:
	docker run --rm -it shiny-auth0 bash

