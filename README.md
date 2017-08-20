# Seq2Seq chatbot (ja)


Overview

## Description
This is seq2seq chatbot.

## Requirement
- Python 3.6
- TensorFlow 1.2
- MeCab
- Tweepy

## Demo

1. Prepare train data.

    1, Registration to the Twitter API(https://apps.twitter.com).

    2, Extraction of consumerkey, consumer secret key, access token key and access token secret key.

    3, Installation forego.

    `$ brew install forego`

    Then, please make `.env` file and write consumerkey, consumer secret key, access token key and access token secret key.

    `$ vi .env` 

    ```
    CONSUMER_KEY=...
    CONSUMER_SECRET=...
    ACCESS_TOKEN=...
    ACCESS_TOKEN_SECRET=...
    ```

    4, `$ forego run python twitter_replies.py data/source.txt data/target.txt`
2. Preprocess the train data and generate vocabulary files, ID files, and some ones.

    `$ python data_processor.py`  

3. Train seq2seq chatbot. When perplexity went down sufficiently and you think it's time to run, just ctrl-c to stop learning. 

    `$ python train.py`

4. Let's talk to him.  

    `$ python predict.py`


## Dockerization

### Requirements

- Docker 17.06.1-ce

- Docker Compose 1.15.0

### Start application

```bash
docker-compose up
```

You can then view the Jupyter Notebook by opening url generated by the above command in your browser.

### Run chat server

```bash
docker-compose exec app bash -c 'FLASK_APP=server.py flask run --host=0.0.0.0'

curl http://localhost:5000/talk?q=おはよう
お は よ

curl http://localhost:5000/talk?q=こんにちは
こんにちワニ
```

## Contribution

### Author

- [wataruhashimoto52](https://github.com/wataruhashimoto52)
