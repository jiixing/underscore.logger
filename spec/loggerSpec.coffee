_console  = require('../lib/underscore.logger')
Logger    = _console.constructor
_         = require 'underscore'

describe 'common-logger', ->
  describe 'levels', ->
    it "should default to debug", ->
      expect(_console.level).toEqual Logger.DEBUG
      
    it "should accept a new log level", ->
      _console.level = Logger.ERROR
      expect(_console.level).toEqual Logger.ERROR
      _console.level = Logger.DEBUG
    
  describe 'color', ->
    it "should have default colors", ->
      expect(_console.colors[Logger.TRACE]).toEqual Logger.ANSI.BLUE
      expect(_console.colors[Logger.DEBUG]).toEqual Logger.ANSI.CYAN
  
  describe 'format', ->
    beforeEach ->
      _console.colorized = false
      _console.out       = (m) -> m
      
    afterEach ->
      _console.colorized = true
      _console.out       = (m) -> console.log m
      
    it 'should default to a date format', ->
      now = new Date().toUTCString()
      expect(_console.info('format')).toEqual "[#{now}] INFO format"
  
  describe 'file', ->
  
  describe 'stream', ->
  
  describe 'grouping', ->
  
  describe 'benchmarking', ->
  
  describe 'fps', ->
    beforeEach ->
      _console.colorized = false
      
    afterEach ->
      _console.colorized = true
      
    it "should clock it!", ->
      _console.on "frame", ->
        expect(@fps).toEqual 60
        @stop()
  
  describe 'cross-browser', ->
  
  describe 'underscore mixin', ->
    beforeEach ->
      _console.colorized = false
      _console.out       = (m) -> m
      
    afterEach ->
      _console.colorized = true
      _console.out       = (m) -> console.log m
      
    it 'should become a mixin!', ->
      expect(_.log).toEqual undefined
      expect(_.fatal).toEqual undefined
      expect(_.error).toEqual undefined
      expect(_.warn).toEqual undefined
      expect(_.info).toEqual undefined
      expect(_.debug).toEqual undefined
      expect(_.trace).toEqual undefined
      
      _.mixin _console.toObject()
      
      expect(_.log).toNotEqual undefined
      expect(_.fatal).toNotEqual undefined
      expect(_.error).toNotEqual undefined
      expect(_.warn).toNotEqual undefined
      expect(_.info).toNotEqual undefined
      expect(_.debug).toNotEqual undefined
      expect(_.trace).toNotEqual undefined
      
      now = new Date().toUTCString()
      
      expect(_.info('format')).toEqual "[#{now}] INFO format"