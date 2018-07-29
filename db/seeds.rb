# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.destroy_all

Status.create!([{name: "new"},
                {name: "approved"},
                {name: "rejected"},
                {name: "voting"},
                {name: "active"},
                {name: "completed"},
                {name: "cancelled"}])
Rank.destroy_all
Rank.create!([{name: 'peridoto', value: 250},
              {name: 'jasper', value: 500},
              {name: 'carnelian', value: 1000},
              {name: 'citrine', value: 2000},
              {name: 'goldenberyl', value: 4000},
              {name: 'spinel', value: 8000},
              {name: 'opal', value: 16000},
              {name: 'pyrite', value: 32000},
              {name: 'quartz', value: 64000},
              {name: 'onyx', value: 128000},
              {name: 'tigerseye', value: 256000},
              {name: 'malachite', value: 512000},
              {name: 'jade', value: 1024000},
              {name: 'feldspar', value: 2048000},
              {name: 'amber', value: 4096000},
              {name: 'agate', value: 8192000},
              {name: 'turquoise', value: 16384000},
              {name: 'amethyst', value: 32768000},
              {name: 'aquamarine', value: 65536000},
              {name: 'topaz', value: 131072000},
              {name: 'sapphire', value: 262144000},
              {name: 'emerald', value: 524288000},
              {name: 'ruby', value: 1048576000},
              {name: 'diamond', value: 2097152000}])
Role.destroy_all
Role.create!([{name: 'leader'},
              {name: 'moderator'},
              {name: 'verifier'},
              {name: 'member'},
              {name: 'tester'},
              {name: 'professor'}])