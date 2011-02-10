################################################################################
#
# Copyright (C) 2009 Tagview Tecnologia (Cassiano D'Andrea - cassiano.dandrea@tagview.com.br)
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

################################################################################
module StringExtensions
  ################################################################################
  def upcase_with_accent_support
    self.
        gsub(/\xC3\xA0/, "\xC3\x80").   # à => À
        gsub(/\xC3\xA1/, "\xC3\x81").   # á => Á
        gsub(/\xC3\xA2/, "\xC3\x82").   # â => Â
        gsub(/\xC3\xA3/, "\xC3\x83").   # ã => Ã
        gsub(/\xC3\xA9/, "\xC3\x89").   # é => É
        gsub(/\xC3\xAA/, "\xC3\x8A").   # ê => Ê
        gsub(/\xC3\xAD/, "\xC3\x8D").   # í => Í
        gsub(/\xC3\xB3/, "\xC3\x93").   # ó => Ó
        gsub(/\xC3\xB4/, "\xC3\x94").   # ô => Ô
        gsub(/\xC3\xB5/, "\xC3\x95").   # õ => Õ
        gsub(/\xC3\xBA/, "\xC3\x9A").   # ú => Ú
        gsub(/\xC3\xBC/, "\xC3\x9C").   # ü => Ü
        gsub(/\xC3\xA7/, "\xC3\x87").   # ç => Ç
        upcase       
  end

  ################################################################################
  def downcase_with_accent_support
    self.
        gsub(/\xC3\x80/, "\xC3\xA0").   # À => à
        gsub(/\xC3\x81/, "\xC3\xA1").   # Á => á
        gsub(/\xC3\x82/, "\xC3\xA2").   # Â => â
        gsub(/\xC3\x83/, "\xC3\xA3").   # Ã => ã
        gsub(/\xC3\x89/, "\xC3\xA9").   # É => é
        gsub(/\xC3\x8A/, "\xC3\xAA").   # Ê => ê
        gsub(/\xC3\x8D/, "\xC3\xAD").   # Í => í
        gsub(/\xC3\x93/, "\xC3\xB3").   # Ó => ó
        gsub(/\xC3\x94/, "\xC3\xB4").   # Ô => ô
        gsub(/\xC3\x95/, "\xC3\xB5").   # Õ => õ
        gsub(/\xC3\x9A/, "\xC3\xBA").   # Ú => ú
        gsub(/\xC3\x9C/, "\xC3\xBC").   # Ü => ü
        gsub(/\xC3\x87/, "\xC3\xA7").   # Ç => ç
        downcase
  end

  ################################################################################
  def titleize_with_accent_support
    tmp = self.
        gsub(/-/, '{{dash}}').
        downcase_with_accent_support.
        titleize.
        gsub('{{Dash}}', '-').
        gsub(/(^|\s)\xC3\xA0/, "\\1\xC3\x80").   # à => À
        gsub(/(^|\s)\xC3\xA1/, "\\1\xC3\x81").   # á => Á
        gsub(/(^|\s)\xC3\xA2/, "\\1\xC3\x82").   # â => Â
        gsub(/(^|\s)\xC3\xA3/, "\\1\xC3\x83").   # ã => Ã
        gsub(/(^|\s)\xC3\xA9/, "\\1\xC3\x89").   # é => É
        gsub(/(^|\s)\xC3\xAA/, "\\1\xC3\x8A").   # ê => Ê
        gsub(/(^|\s)\xC3\xAD/, "\\1\xC3\x8D").   # í => Í
        gsub(/(^|\s)\xC3\xB3/, "\\1\xC3\x93").   # ó => Ó
        gsub(/(^|\s)\xC3\xB4/, "\\1\xC3\x94").   # ô => Ô 
        gsub(/(^|\s)\xC3\xB5/, "\\1\xC3\x95").   # õ => Õ 
        gsub(/(^|\s)\xC3\xBA/, "\\1\xC3\x9A").   # ú => Ú
        gsub(/(^|\s)\xC3\xBC/, "\\1\xC3\x9C").   # ü => Ü
        gsub(/(^|\s)\xC3\xA7/, "\\1\xC3\x87")    # ç => Ç
        
    tmp.gsub(/(\xC3[\xA0\xA1\xA2\xA3\xA9\xAA\xAD\xB3\xB4\xB5\xBA\xBC\xA7\x80\x81\x82\x83\x89\x8A\x8D\x93\x94\x95\x9A\x9C\x87])([A-Z])/) do 
      $1 + $2.downcase
    end
  end                                         

  ################################################################################
  def no_accent
    self.
        gsub(/\xC3\xA0/,  'a').     # à => a
        gsub(/\xC3\xA1/,  'a').     # á => a
        gsub(/\xC3\xA2/,  'a').     # â => a
        gsub(/\xC3\xA3/,  'a').     # ã => a
        gsub(/\xC3\xA9/,  'e').     # é => e
        gsub(/\xC3\xAA/,  'e').     # ê => e
        gsub(/\xC3\xAD/,  'i').     # í => i
        gsub(/\xC3\xB3/,  'o').     # ó => o
        gsub(/\xC3\xB4/,  'o').     # ô => o
        gsub(/\xC3\xB5/,  'o').     # õ => o
        gsub(/\xC3\xBA/,  'u').     # ú => u
        gsub(/\xC3\xBC/,  'u').     # ü => u
        gsub(/\xC3\xA7/,  'c').     # ç => c
        gsub(/\xC3\x80/,  'A').     # À => A
        gsub(/\xC3\x81/,  'A').     # Á => A
        gsub(/\xC3\x82/,  'A').     # Â => A
        gsub(/\xC3\x83/,  'A').     # Ã => A
        gsub(/\xC3\x89/,  'E').     # É => E
        gsub(/\xC3\x8A/,  'E').     # Ê => E
        gsub(/\xC3\x8D/,  'I').     # Í => I
        gsub(/\xC3\x93/,  'O').     # Ó => O
        gsub(/\xC3\x94/,  'O').     # Ô => O
        gsub(/\xC3\x95/,  'O').     # Õ => O
        gsub(/\xC3\x9A/,  'U').     # Ú => U
        gsub(/\xC3\x9C/,  'U').     # Ü => U
        gsub(/\xC3\x87/,  'C')      # Ç => C
  end

  ################################################################################
  def unindent(left_spaces_to_trim)
    self.
      gsub(/\A\n/, '').                         # Remove initial "\n", if any.
      gsub(/^\s{#{left_spaces_to_trim}}/, '')   # Remove trailing <spaces_to_unindent> spaces from each line.
  end

  ################################################################################
  def cleanse
    self.strip.squeeze(' ')
  end

  ################################################################################
  def remove_html(*except_tags)
    options = except_tags.extract_options!.symbolize_keys

    helpers.sanitize(self.cleanse.remove_html_entities, :tags => except_tags.flatten, :attributes => options[:attributes])
  end

  ################################################################################
  def remove_html_entities
    HTMLEntities.new.decode(self)
  end

  ################################################################################
  def delimit(limit, delimiter)
    self.gsub(/([^#{delimiter}]{#{limit+1},})/) { |e| e.gsub(/(.{#{limit}})/, "\\1#{delimiter}") }
  end
    
  ################################################################################
  def to_local_datetime
    if self =~ %r(^(\d{1,2})/(\d{1,2})/(\d{1,4}) (\d{1,2}):(\d{1,2}):(\d{1,2})$)    # E.g. '23/05/2010 09:04:01'
      Time.zone.parse("#{$3}-#{$2}-#{$1} #{$4}:#{$5}:#{$6}") rescue nil
    elsif self =~ %r(^(\d{1,2})/(\d{1,2})/(\d{1,4}) (\d{1,2}):(\d{1,2})$)           # E.g. '23/05/2010 09:04'
      Time.zone.parse("#{$3}-#{$2}-#{$1} #{$4}:#{$5}:00") rescue nil
    elsif self =~ %r(^(\d{1,2})/(\d{1,2})/(\d{1,4})$)                               # E.g. '23/05/2010'
      Time.zone.parse("#{$3}-#{$2}-#{$1}") rescue nil
    elsif self =~ %r(^(\d{1,4})-(\d{1,2})-(\d{1,2})T(\d{1,2}):(\d{1,2}):(\d{1,2})Z$)
      Time.zone.parse("#{$1}-#{$2}-#{$3} #{$4}:#{$5}:#{$6}") rescue nil
    end
  end
  
  ################################################################################
  def proper_name
    self.titleize_with_accent_support.gsub(/ D(a|e|o|as|os) /, ' d\1 ').gsub(/ E /, ' e ')
  end
  
  ################################################################################  
  # Truncates a given +text+ after a given <tt>length</tt> if +text+ is longer than <tt>length</tt>:
  #
  #   "Once upon a time in a world far far away".truncate(27)
  #   # => "Once upon a time in a wo..."
  #
  # The last characters will be replaced with the <tt>:omission</tt> string (defaults to "...")
  # for a total length not exceeding <tt>:length</tt>:
  #
  #   "Once upon a time in a world far far away".truncate(27, :separator => ' ')
  #   # => "Once upon a time in a..."
  #
  # Pass a <tt>:separator</tt> to truncate +text+ at a natural break:
  #
  #   "And they found that many people were sleeping better.".truncate(25, :omission => "... (continued)")
  #   # => "And they f... (continued)"
  def truncate(length, options = {})
    text = self.dup
    options[:omission] ||= "..."

    length_with_room_for_omission = length - options[:omission].mb_chars.length
    chars = text.mb_chars
    stop = options[:separator] ?
      (chars.rindex(options[:separator].mb_chars, length_with_room_for_omission) || length_with_room_for_omission) : length_with_room_for_omission

    (chars.length > length ? chars[0...stop] + options[:omission] : text).to_s
  end  
end

################################################################################
String.send :include, StringExtensions
