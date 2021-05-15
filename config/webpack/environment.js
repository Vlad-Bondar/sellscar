const { environment } = require('@rails/webpacker');
const jquery = require('./plugins/jquery')
const customConfig = require('./custom');
const webpack = require('webpack');

environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
);
environment.config.merge(customConfig);

environment.plugins.prepend('jquery', jquery)
module.exports = environment;