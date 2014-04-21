###
  Einbinden des Persistenz-Layer und definieren des DB-Schema
###

mongoose = require 'mongoose'
timestamps = require 'mongoose-timestamp'

ScrumboardTask = new mongoose.Schema

  label:
    type: String
    required: true
  text:
    type: String
  toDo:
    type: Boolean
    default: false
  inProgress:
    type: Boolean
    default: false
  done:
    type: Boolean
    default: false
  date:
    type: Date
    default: Date.now
  effort:
    type: Number
    default: 0
  employee:
    type: String

,
  collection: 'scrumboard.tasks'


# Timestamps registrieren
ScrumboardTask.plugin timestamps


module.exports = ->
  ScrumboardTask: mongoose.model 'ScrumboardTask', ScrumboardTask