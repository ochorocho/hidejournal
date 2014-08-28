# Redmine Hidejournal Plugin

This plugin hides newly added journals by default (only when user is allowed to view **private notes**)

A additional button is shown on the journal listing to show/hide each journal

## Tested with the following setup

* Redmine version 2.5.1.stable
* Ruby version 2.1.2-p95 (2014-05-08) [x86_64-linux]
* Rails version 3.2.17


## Installation

_Clone repository:_

```
git clone https://github.com/ochorocho/hidejournal.git
```

_Run migration:_

```
cd /your/redmine/root/
rake redmine:plugins:migrate RAILS_ENV=production
```

_Restart Redmine:_

```
cd /your/redmine/root/
touch tmp/restart.txt
```

**Found a Bug or a way to improve the code?**

Please create a [New Issue](https://github.com/ochorocho/hidejournal/issues) in my Github repo.