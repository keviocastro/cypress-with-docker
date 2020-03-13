## Cypress with docker

Image with resources for use on ci / cd

This image contains:   
- docker
- docker-compose
- cypress
- dockerize

Gitlab example:

```
test:
  stage: test
  image: keviocastro/cypress-with-docker
  services:
    - docker:dind
  script:
    - docker login registry.gitlab.com -u <user> -p <token>
    - docker-compose up -d
    - dockerize -wait localhost:8082 -timeout 2m
    - npm install
    - npm test
```