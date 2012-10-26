#!/usr/bin/ruby1.8

require 'yaml'
require 'fileutils'
require 'kconv'

@baseurl = "http://ftp.orca.med.or.jp/pub/receipt/plugin/4.7.0/"
@distdir = "dist"
@list    = "plugin.yml"
@keyuser = "plugintest"
@passphrase = "test"

def check_control(c)
  raise "invalid control: no name" unless c[:name] 
  raise "invalid control: no version" unless c[:version] 
  raise "invalid control: no vendor" unless c[:vendor]
end

def clean
  # dist clean
  FileUtils.rm_rf(@distdir)
  FileUtils.mkdir_p(@distdir)
end

def make_list
  # make list
  list = []
  Dir.glob("*/").each do |d|
    cfile = File.join(d,"meta","control")
    next unless File.exist?(cfile)
    begin
      control = YAML.load_file(cfile)
      check_control(control)
      control[:dir] = d
      control[:filename] = control[:name] + "-" + control[:version] + ".jpp"
      list << control
    rescue Exception => ex
      puts "invalid meta/control in #{d}"
      puts ex
    end
  end
  list.sort!do|a,b| a[:name] <=> b[:name] end
  date = Time.now.strftime("%Y-%m-%d")
  
  str = "---\n"
  list.each do |c|
    url = @baseurl + c[:filename]
    str << %|  - :name: "#{c[:name]}"\n|
    str << %|    :version: "#{c[:version]}"\n|
    str << %|    :vendor: "#{c[:vendor]}"\n|
    str << %|    :description: "#{c[:description].toeuc}"\n|
    str << %|    :date: #{date}\n|
    str << %|    :url: #{url}\n|
  end
  listfile = File.join(@distdir,@list)
  File.open(listfile,"w") do|io| io.puts str end
  sign(listfile)
  list
end

def exec(command)
  print command
  `#{command}`
  if $? == 0
    puts "  ... success"
  else
    puts "  ... error"
  end
end

def sign(file)
  if @passphrase.nil? || @passphrase.empty?
    exec("gpg -u #{@keyuser} -abs #{file}")
  else
    exec("gpg --passphrase #{@passphrase} -u #{@keyuser} -abs #{file}")
  end
end

def make_package(list)
  list.each do |c|
    pkgfile = File.join(@distdir,c[:filename])
    exec("tar zcvf #{pkgfile} #{c[:dir]}")
    sign(pkgfile)
  end
end

if $0 == __FILE__
  clean
  make_package(make_list)
end
