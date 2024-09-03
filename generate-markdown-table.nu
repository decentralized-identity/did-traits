#!/usr/bin/env nu
let properties = open ./schemas/traits.json | $in.properties
$properties | columns | filter {|c| $c != "name" and $c != "url"} | each {|c|
  {Trait: $"<a id=\"($c)\">($properties | get $c | get title)</a>", Definition: ($properties | get $c | get description) }
} | to md
