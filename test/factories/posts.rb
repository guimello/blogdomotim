# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :post do |f|
  f.user nil
  f.title "MyString"
  f.body "MyText"
end