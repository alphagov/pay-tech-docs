# Technical Documentation

## Getting started

You can [read documentation about the GDS technical documentation
tool][tdt-documentation] [external link].

To preview or build the website, we need to use the terminal.

Install Ruby with Rubygems, preferably with a [Ruby version manager][rvm],
and the [Bundler gem][bundler].

In the application folder type the following to install the required gems:

```
bundle install
```

### Optional analytics assets

In the application folder type the following to install optional client side
Javascripts to enable the Google Analytics consent banner:

```
npm install
```

## Making changes

To make changes edit the source files in the `source` folder.

Although a single page of HTML is generated the markdown is spread across
multiple files to make it easier to manage. They can be found in
`source/documentation`.

A new markdown file isn't automatically included in the generated output. If we
add a new markdown file at the location `source/documentation/agile/scrum.md`,
the following snippet in `source/index.html.md.erb`, includes it in the
generated output.

```
<%= partial 'documentation/agile/scrum' %>
```

Including files manually like this lets us specify the position they appear in
the page.

## Preview

Whilst writing documentation we can run a middleman server to preview how the
published version will look in the browser. After saving a change the preview in
the browser will automatically refresh.

The preview is only available on our own computer. Others won't be able to
access it if they are given the link.

Type the following to start the server:

```
bundle exec middleman server
```

If all goes well something like the following output will be displayed:

```
== The Middleman is loading
== LiveReload accepting connections from ws://192.168.0.8:35729
== View your site at "http://Laptop.local:4567", "http://192.168.0.8:4567"
== Inspect your site configuration at "http://Laptop.local:4567/__middleman", "http://192.168.0.8:4567/__middleman"
```

You should now be able to view a live preview at http://localhost:4567.

## Build

If you want to publish the website without using a build script you may need to
build the static HTML files.

Type the following to build the HTML:

```
bundle exec middleman build
```

This will create a `build` subfolder in the application folder which contains
the HTML and asset files ready to be published.

During the build, [`html-proofer`](https://github.com/gjtorikian/html-proofer)
will check the HTML files for broken internal links.

## Updating the template

You can update to the latest version of [tech-docs-template][] by running:

```
bundle update govuk_tech_docs
```

Read [the changelog for the gem][gem-changelog] for the latest changes.

[gem-changelog]: https://github.com/alphagov/tech-docs-gem/blob/master/CHANGELOG.md

[rvm]: https://www.ruby-lang.org/en/documentation/installation/#managers
[bundler]: http://bundler.io/
[tdt-documentation]: https://tdt-documentation.london.cloudapps.digital
