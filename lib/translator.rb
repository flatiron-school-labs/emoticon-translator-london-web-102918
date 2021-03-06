require "yaml"

def load_library(file_path)
  lolwtf = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(file_path).each do |name, emoticon_array|
    en_emote = emoticon_array[0] 
    jap_emote = emoticon_array[1] 
    lolwtf["get_meaning"][emoticon_array[1]] = name
    lolwtf["get_emoticon"][emoticon_array[0]] = jap_emote
  end
  lolwtf
end

# because the english emoticon is the key to the japanese emoticon

def get_japanese_emoticon(file_path, emoticon)
  trans = load_library(file_path)
  jap_emote = trans["get_emoticon"][emoticon]
  trans["get_emoticon"].include?(emoticon) ? jap_emote : "Sorry, that emoticon was not found" 
end

def get_english_meaning(file_path, emoticon)
  trans = load_library(file_path)
  en_emote = trans["get_meaning"][emoticon]
  trans["get_meaning"].include?(emoticon) ? en_emote : "Sorry, that emoticon was not found" 
end