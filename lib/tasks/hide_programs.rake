require 'rake'
namespace :hide_programs do
  task :hide => :environment do
    prog = Program.where(:code => "006").first
    prog.active = false
    if prog.save
      p "#{prog.name} ocultado satisfactoriamente"
    end
  end
end
