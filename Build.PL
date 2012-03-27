
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Excludes untracked files from your dist",
  "dist_author" => [
    "Rob Hoelz <rob\@hoelz.ro>"
  ],
  "dist_name" => "Dist-Zilla-Plugin-Git-ExcludeUntracked",
  "dist_version" => "0.01",
  "license" => "perl",
  "module_name" => "Dist::Zilla::Plugin::Git::ExcludeUntracked",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Dist::Zilla" => 0,
    "perl" => "v5.8.8"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
