require 'open3'

class Transformer
  def compress(string)

    file = Tempfile.new('javascript_file_to_be_compressed')
    file.path      # => A unique filename in the OS's temp directory,
                   #    e.g.: "/tmp/foo.24722.0"
                   #    This filename contains 'foo' in its basename.
    file.write(string)
    file.rewind
    file.read      # => "hello world"


    output = ""
    puts "compressing!"
    #puts string
    Open3.popen3("yarn run terser #{file.path } --compress --mangle") do |stdin, stdout, stderr, wait_thr|
    #Open3.popen3("/usr/bin/pandoc -s -f markdown -t pdf #{dir}/basic_markdown_editor.md") do |stdin, stdout, stderr, wait_thr|
      #stdin.puts "This is sent to the command"
      #stdin.close                # we're done
      output = stdout.read   # read stdout to string. note that this will block until the command is done!
      #status = wait_thr.value
    end
    #remove the first two lines
    unless output.blank?
      output = output.lines[2..-1].join unless output.lines.nil?
      #remove last line
      output = output.lines[0..-2].join unless output.nil?
    else
      output = "nix"
    end

    file.close
    file.unlink
    #yarn run uglifyjs javascript/blog-filter-with-bootstrap-cards.js -c -m reserved=['bootstrap_cards_object'] -o javascript/master-blog-filter-with-bootstrap-cards.min.js
    output
  end
end
