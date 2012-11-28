# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#server_table').dataTable
    bFilter:        true
    bSort:          true
    bPaginate:      true
    iDisplayLength: 20
    bLengthChange:  false
    bInfo:          true
  $('#table_no_paginate').dataTable
    bFilter:        true
    bSort:          true
    bPaginate:      false
    bInfo:          false
  $('#rack_table').dataTable
    bSort:          true
    bFilter:        false
    bPaginate:      false
    bInfo:          false

    

