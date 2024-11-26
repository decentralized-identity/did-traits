#!/usr/bin/env nu
let properties = open ./schemas/traits.json | $in.properties
ls methods/*.json | each {|file|
  let method = open $file.name
  let traits = { Method: $"[did:($method.name)]\(https://www.w3.org/TR/did-extensions-methods/#did-methods\)" }
  # $traits | merge
  ($properties | columns | filter {$in != "name"} | each {|name|
    { trait: $"[($properties | get $name | get title)]\(#($name)\)", value: ($method | default false $name | get $name | if $in { "✅" } else { "" }) }
  }) | reduce -f $traits {|it, acc| $acc | insert $it.trait $it.value }
} | to md
