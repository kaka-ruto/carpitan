import { application } from "./application"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

const context = require.context(".", true, /_controller\.js$/)
application.load(definitionsFromContext(context))