# Программа, которая шифрует введённое пользователем слово одним из механизмов MD5 или SHA1

# encoding: utf-8
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#*************************начало функции: cypher(encode, str)**********************************************

# 1. Функция шифрования cypher(encode, str), которая в зависимости от параметра шифрования
# шифрует слово или фразу, введенное в качестве 2-го параметра
# 2. Параметры: encode - способ шифрования (MD5, SHA1, SHA2); str - слово или фраза
# 3. Возвращает: зашиврованное слово или фразу
def cypher(encode, str)
  # Подключим библиотеку шифрования
  require "digest"

  # Создадим три объекта шифрования
  md5_encode = Digest::MD5.new
  sha1_encode = Digest::SHA1.new
  sha2_encode = Digest::SHA2.new

  if (encode != "" || encode != nil) && (str != "" || str != nil)
    # Зашифруем сроку одним из трех способов md5, sha1 или sha2
    case encode
      when 'md5'
        md5_encode << str
        return  md5_encode.hexdigest

      when 'sha1'
        sha1_encode << str
        return  sha1_encode.hexdigest

      when 'sha2'
        sha2_encode << str
        return  sha2_encode.hexdigest

    else
        puts "Этим способом:#{encode} зашифровать нельзя!!!"
    end
  else
    puts "Параметры должны быть заполнены!!!"
  end
end

#*************************конец функции***************************************************************

words = ""

# Будем задавать вопрос пока пользователь не слово или фразу
while words == ""
  puts "Введите слово или фразу для шифрования:"
  words = STDIN.gets.chomp
end

method = 0

# Будем задавать вопрос пока пользователь не введет 1 или 2
while method < 1 || method > 3
  puts "\nКаким способом зашифровать:\n1. MD5\n2. SHA1\n3. SHA2"
  method = STDIN.gets.chomp.to_i
end

encoding = ""

if method == 1
  puts "\nВот что получилось:\n#{cypher(encoding = "md5", words).to_s}"
elsif method == 2
  puts "\nВот что получилось:\n#{cypher(encoding = "sha1", words).to_s}"
else
  puts "\nВот что получилось:\n#{cypher(encoding = "sha2", words).to_s}"
end
