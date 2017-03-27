FROM haskell:8.0.2

MAINTAINER Javier L. Velasquez <nycjv321@gmail.com>

COPY . /
RUN ghc nato_phone_translator && rm *.o *.hi *.hs
ENTRYPOINT ["./nato_phone_translator"]
CMD [""]
