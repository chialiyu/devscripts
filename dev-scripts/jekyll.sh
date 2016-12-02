#installation
gem sources --remove https://rubygems.org
gem sources -a http://rubygems.org
sudo gem install jekyll

#install plug-ins
sudo gem install jekyll-sitemap --verbose
sudo gem install jekyll-feed --verbose
sudo gem install kramdown
sudo gem install jekyll-watch
#last step
bundle install

#Build the website
bundle exec jekyll build
bundle exec jekyll serve

cp -r ~/gitkitchensink/chialiyu.github.io.raw/_site/* ~/gitkitchensink/chialiyu.github.io/
cp -r ~/gitkitchensink/chialiyu.github.io.raw/_site/* ~/gitkitchensink/test/




#Reference
http://charliepark.org/jekyll-with-plugins/
