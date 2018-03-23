
### Training a fastText model in a GitHub repo's continuous build
*Lang id for English and Spanish trained and tested on two Wikipedia articles*  

This repo trains and tests a [fastText](https://github.com/facebookresearch/fastText) prediction model automatically on submit.  Current status: [![Build Status](https://travis-ci.org/RAU-NLP/lang-id.png)](https://travis-ci.org/RAU-NLP/lang-id)

The model is supervised classification for language identification.  

The dataset included in the repo is 4 Wikipedia pages.  The training set is the text from en.wikipedia.org/wiki/Nikola_Tesla and es.wikipedia.org/wiki/Nikola_Tesla, and the test set is the text from en.wikipedia.org/wiki/Beet and es.wikipedia.org/wiki/Cerveza.  Each line is simply labelled English or Spanish in the fastText format.

On submit the scripts are run by Travis CI, a continuous integration service free for open-source repos.  Each run takes only a few seconds.  With the default parameters, the resulting prediction model's accuracy on the test set is about 75%.

#### Viewing the results

Visit [travis-ci.org/RAU-NLP/lang-id](https://travis-ci.org/RAU-NLP/lang-id/builds), click a build and view the *Job log*

```
TRAINING MODEL...
Read 0M words
Number of words:  8823
Number of labels: 2
Progress: 100.0% words/sec/thread: 2144907 lr:  0.000000 loss:  0.382529 ETA:   0h 0m

TESTING MODEL...
N	1013
P@1	0.767
R@1	0.767
Number of examples: 1013
```

#### Running on your own repo

[Fork this repo](https://github.com/RAU-NLP/lang-id/fork) and [add Travis CI](https://docs.travis-ci.com/user/getting-started/) to your repo

#### Playing with the parameters

Edit the [`fasttext supervised` parameters](https://github.com/facebookresearch/fastText#full-documentation) in `run.sh` in your repo

To avoid a run on minor updates, add `[skip ci]` or `[ci skip]` to the commit message.

#### Running locally

```
sh init.sh
sh run.sh
```

To play with the resulting model:  
```
./fastText/fasttext predict data/lang-id/model.bin -
This is not a test.
__label__en
Esto no es prueba.
__label__es
```
