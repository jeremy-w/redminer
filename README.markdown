# Redminer

**⚠️ NOTE: Redminer is unmaintained. PRs are welcome, but I won't be hacking on this myself any time soon.**

## What
Redminer is a commandline interface to the Redmine API.
The Redmine API is limited in scope, and so is this tool.

## Why
I needed an easy way to post time entries to Redmine.

## Why Not
Redminer is held together with spit and baling wire.
It works for me, but I don't like it.
I recommend against adopting it at this time.

Nevertheless, if you're looking for a commandline interface to Redmine,
here you go.

## Features
* List recent time entries
* Search back a bit to find recent time entries owned by you
* Add a new time entry
* List your user info
* List projects
* List issues
* Fetch issue by id -- useful for making sure you've got the right id
  when you go to add time to it.

## Dependencies
Redminer depends on the OS X keychain for storage of your login info,
and on your sufferance for its continued existence.
It begs a thousand pardons that it should be so ugly and yet live.

## Setup
Add a new Internet password named "redmine" with the correct host.
Add "api: &lt;yourkey&gt;" to the comments field.

Using Keychain.app:

- Choose File > New Password, or just hit Cmd-N.
  - First field is the web address of your Redmine host (include the http:// or
    https:// part).
  - Second field is your Redmine username.
  - Third field is your Redmine account password.
  - Now add the password entry to the Keychain using the button in the lower
    right.

- Now double-click to edit the password:
  - Change the name to just "redmine".
  - In the Comments field, put "api: 1234…abcd", replacing the part after
    "api: " with your API key.

## Todo
* Non-fugly user interface. (YAML hash dump? Really?)
* An actual user interface supporting flags and some flexibility,
  not one that barely works.
* Custom printers for issues and such. Leave dumping the whole object tree to
  `--debug` or something like that.
* Maybe expose some more of the Redmine API. Maybe.
