# Lab

A Vagrant box for development

## Requirements

* [VirtualBox](https://www.virtualbox.org/)

* [Vagrant](https://www.vagrantup.com/)

* [Berkshelf](http://berkshelf.com/)

* vagrant-berkshelf plugin

```
vagrant plugin install vagrant-berkshelf
```

* nugrant vagrant plugin


```
vagrant plugin install nugrant
```

* omnibus vagrant plugion


```
vagrant plugin install vagrant-omnibus
```

### Optional plugins

- vagrant-vbguest - Install/Update VirtualBox Guest Additions

```
vagrant plugin install vagrant-vbguest
```

### Booting

Run berkshelf (only needed for cold starts)

```
berks install
```

Start Vagrant

```
vagrant up
```
