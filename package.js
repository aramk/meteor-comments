// Meteor package definition.
Package.describe({
  name: 'aramk:comments',
  version: '0.1.0',
  summary: 'User comments',
  git: 'https://github.com/aramk/meteor-comments.git'
});

Package.onUse(function (api) {
  api.versionsFrom('METEOR@0.9.0');
  api.use([
    'coffeescript',
    'underscore',
    'templating',
    'less',
    'reactive-var@1.0.4',
    'tracker@1.0.5',
    'aldeed:simple-schema@1.3.2',
    'aldeed:collection2@2.3.3',
    'urbanetic:utility@1.0.1'
  ], ['client', 'server']);
  api.use([
    'semantic:ui-css@2.0.8'
  ], {weak: true});
  api.imply('semantic:ui-css');
  api.export([
    'Comments'
  ], ['client', 'server']);
  api.addFiles([
    'src/comment.html',
    'src/comment.coffee',
    'src/commentList.html',
    'src/commentList.coffee',
    'src/commentList.less',
    'src/commentForm.html',
    'src/commentForm.coffee'
  ], 'client');
  api.addFiles([
    'src/Comments.coffee'
  ], ['client', 'server']);
});
