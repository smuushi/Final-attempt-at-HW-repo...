ActiveRecord::StatementInvalid: PG::UndefinedColumn: ERROR:  column users.instructor_id does not exist
LINE 1: SELECT "users".* FROM "users" WHERE "users"."instructor_id" ...
                                            ^

from /home/smuushi/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/activerecord-7.0.4.2/lib/active_record/connection_adapters/postgresql_adapter.rb:837:in `prepare'
Caused by PG::UndefinedColumn: ERROR:  column users.instructor_id does not exist
LINE 1: SELECT "users".* FROM "users" WHERE "users"."instructor_id" ...
                                            ^

from /home/smuushi/.rbenv/versions/3.1.1/lib/ruby/gems/3.1.0/gems/activerecord-7.0.4.2/lib/active_record/connection_adapters/postgresql_adapter.rb:837:in `prepare'