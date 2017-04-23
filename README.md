# Redmine Hidejournal Plugin

This plugin hides newly added journals by default (only when user is allowed to view **private notes**)

A additional button is shown on the journal listing to show/hide each journal

## Tested with the following setup

* Redmine version 2.5.1.stable / 2.6.0.stable / 3.3.2.stable
* Ruby version 2.1.2-p95 (2014-05-08) [x86_64-linux] / ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]
* Rails version 3.2.17 / 3.2.19 / 4.2.7.1


## Installation

_Clone repository:_

```
cd /your/redmine/root/plugins
git clone https://github.com/ochorocho/hidejournal.git
```

_Restart Redmine:_

```
cd /your/redmine/root/
touch tmp/restart.txt
```

**Found a Bug or a way to improve the code?**

Please create a [New Issue](https://github.com/ochorocho/hidejournal/issues) in my Github repo.
