## Reading Rails

This is a very basic rails 4 application that aims to show the usage of `Kernel#caller` method and allows the user to learn something about the rails request lifecycle.

### Usage

```shell
  bundle install
  rake db:migrate
  bundle exec rails s
```

Now head with your browser to `http://locahost:3000`, you should be able to see the whole execution stack of the current request, which involves about 110 files inside rails sourcecode, webrick and rack.

![homepage](https://raw.githubusercontent.com/mikamai/read_rails/master/public/screenshot.png "homepage")

Each line is clickabe and will show the actual content of the source file directly in the browser, so you can follow along with the sourcecode to learn how rails works.

![listing code](https://raw.githubusercontent.com/mikamai/read_rails/master/public/screenshot_1.png "listing code")