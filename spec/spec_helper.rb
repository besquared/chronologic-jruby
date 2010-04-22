require 'rubygems'

require File.join(File.dirname(__FILE__), '..', 'src', 'chronologic.rb')

def recreate_index!(name)
  Chronologic::Indices::EventIndex.new(name).recreate!
end

def load_sessions_data
  sessions = Chronologic::Timeline.new('sessions')
  
  josh = 1
  coda = 2
  
  joshs_first_session = {'occurred_at' => Time.mktime(2010, 01, 02).to_i, 'user_id' => josh}
  codas_first_session = {'occurred_at' => Time.mktime(2010, 01, 04).to_i, 'user_id' => coda}
  joshs_second_session = {'occurred_at' => Time.mktime(2010, 01, 10).to_i, 'user_id' => josh}
  codas_second_session = {'occurred_at' => Time.mktime(2010, 01, 15).to_i, 'user_id' => coda}
  
  sessions.append(1, joshs_first_session)
  sessions.append(2, codas_first_session)
  sessions.append(3, joshs_second_session)
  sessions.append(4, codas_second_session)
end

def load_registrations_data
  registrations = Chronologic::Timeline.new('registrations')
  
  josh = 1
  coda = 2
  
  josh_registers = {'occurred_at' => Time.mktime(2010, 01, 02).to_i, 'user_id' => josh}
  coda_registers = {'occurred_at' => Time.mktime(2010, 01, 04).to_i, 'user_id' => coda}
  
  registrations.append(1, josh_registers)
  registrations.append(2, coda_registers)
end