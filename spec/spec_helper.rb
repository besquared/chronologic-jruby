require 'rubygems'

require File.join(File.dirname(__FILE__), '..', 'src', 'chronologic.rb')

def recreate_index!(name)
  Chronologic::Indices::EventIndex.new(name).recreate!
end

def load_sessions_data
  sessions = Chronologic::Timeline.new('sessions')
  
  josh = 1
  coda = 2
  
  joshs_first_session = Chronologic::Indices::EventDocument.new
  joshs_first_session.add('event_id', 1, true)
  joshs_first_session.add('occurred_at', Time.mktime(2010, 01, 02).to_i, true)
  joshs_first_session.add('user_id', josh, true)
  
  codas_first_session = Chronologic::Indices::EventDocument.new
  codas_first_session.add('event_id', 2, true)
  codas_first_session.add('occurred_at', Time.mktime(2010, 01, 04).to_i, true)
  codas_first_session.add('user_id', coda, true)
  
  joshs_second_session = Chronologic::Indices::EventDocument.new
  joshs_second_session.add('event_id', 3, true)
  joshs_second_session.add('occurred_at', Time.mktime(2010, 01, 10).to_i, true)
  joshs_second_session.add('user_id', josh, true)
  
  codas_second_session = Chronologic::Indices::EventDocument.new
  codas_second_session.add('event_id', 4, true)
  codas_second_session.add('occurred_at', Time.mktime(2010, 01, 15).to_i, true)
  codas_second_session.add('user_id', coda, true)
  
  sessions.append(joshs_first_session)
  sessions.append(codas_first_session)
  sessions.append(joshs_second_session)
  sessions.append(codas_second_session)
end

def load_registrations_data
  registrations = Chronologic::Timeline.new('registrations')
  
  josh = 1
  coda = 2
  
  joshs_registration = Chronologic::Indices::EventDocument.new
  joshs_registration.add('event_id', 1, true)
  joshs_registration.add('occurred_at', Time.mktime(2010, 01, 02).to_i, true)
  joshs_registration.add('user_id', josh, true)
  
  codas_registration = Chronologic::Indices::EventDocument.new
  codas_registration.add('event_id', 2, true)
  codas_registration.add('occurred_at', Time.mktime(2010, 01, 04).to_i, true)
  codas_registration.add('user_id', coda, true)
  
  registrations.append(joshs_registration)
  registrations.append(codas_registration)
end