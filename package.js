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
    'aramk:utility@0.8.6',
    'aldeed:simple-schema@1.3.2',
    'aldeed:collection2@2.3.3'
  ], 'client');
  api.use([
    'semantic:ui-css@1.11.5'
  ], {weak: true});
  api.imply('semantic:ui-css');
  api.export('Comments', 'client');
  api.addFiles([
    'src/Comments.coffee',
    'src/comment.html',
    'src/comment.coffee',
    'src/commentList.html',
    'src/commentList.coffee',
    'src/commentList.less'
  ], 'client');
});
