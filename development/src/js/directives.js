import Vue from 'vue';
import $ from 'jquery';
import 'bootstrap';
import 'popper.js';
import { DEFAULT_VALUE } from './helpers/constants';

Vue.directive('tooltip', (el, binding) => {
  if (typeof binding.value === 'undefined') {
    return DEFAULT_VALUE;
  }
  $(el).tooltip('dispose').tooltip({
    title: binding.value.toString(),
    placement: binding.arg,
    trigger: 'hover',
  });
  return true;
});
