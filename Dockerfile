ARG RUBY_VERSION=2.7.0
FROM ruby:${RUBY_VERSION}

RUN wget http://www.freetds.org/files/stable/freetds-1.1.24.tar.gz \
    && tar -xzf freetds-1.1.24.tar.gz \
    && cd freetds-1.1.24 \
    && ./configure --prefix=/usr/local --with-tdsver=7.3 \
    && make \
    && make install

WORKDIR /app
RUN echo 'source "https://rubygems.org/"'    > Gemfile
RUN echo 'gem "activesupport"'               >> Gemfile
RUN echo 'gem "certified"'                   >> Gemfile
RUN echo 'gem "colorize"'                    >> Gemfile
RUN echo 'gem "configatron"'                 >> Gemfile
RUN echo 'gem "faker"'                       >> Gemfile
RUN echo 'gem "headless"'                    >> Gemfile
RUN echo 'gem "httparty"'                    >> Gemfile
RUN echo 'gem "json"'                        >> Gemfile
RUN echo 'gem "json-schema"'                 >> Gemfile
RUN echo 'gem "money"'                       >> Gemfile
RUN echo 'gem "mysql2"'                      >> Gemfile
RUN echo 'gem "parallel_tests", "2.14.1"'    >> Gemfile
RUN echo 'gem "php-serialize", "1.2"'        >> Gemfile
RUN echo 'gem "pry"'                         >> Gemfile
RUN echo 'gem "pry-doc"'                     >> Gemfile
RUN echo 'gem "page-object", "2.2.4"'        >> Gemfile
RUN echo 'gem "rest-client"'                 >> Gemfile
RUN echo 'gem "rspec"'                       >> Gemfile
RUN echo 'gem "rubocop"'                     >> Gemfile
RUN echo 'gem "rspec-collection_matchers"'   >> Gemfile
RUN echo 'gem "sequel"'                      >> Gemfile
RUN echo 'gem "systemu"'                     >> Gemfile
RUN echo 'gem "watir", "6.16"'               >> Gemfile
RUN echo 'gem "watir-dom-wait"'              >> Gemfile
RUN echo 'gem "win32-security"'              >> Gemfile

RUN bundle install
