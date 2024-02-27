
# bvoightlab's Website

Visit **[voightlab.com](http://voightlab.com)** 🚀

To set up (on Sparky) Docker for previewing:
- Spin up Docker Desktop
- In windows search, run: cmd
- navigate to the main github repo directory
- then run: wsl
- then run: .docker/run.sh

_Built with [Lab Website Template](https://greene-lab.gitbook.io/lab-website-template-docs)_

## note on updating citation

1. update Voight_publication_doi_taglist.xlsx with relevant info
2. save tab as Voight_publication_doi_taglist.csv
3. mv ../_data/sources.yaml ../_data/sources.yaml.bk
4. ./mk_sourcesyaml.pl Voight_publication_doi_taglist.csv >mysources.yaml
5. cp mysources.yaml ../_data/sources.yaml
