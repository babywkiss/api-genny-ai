(git clone https://github.com/ggerganov/llama.cpp.git || true) &&
cd llama.cpp &&
make -j LLAMA_CURL=ON &&
./main \
  -c 512 \
  -hfr "QuantFactory/Meta-Llama-3-8B-Instruct-GGUF" \
  -m Meta-Llama-3-8B-Instruct.Q4_K_M.gguf
  # --grammar-file ./grammar.gbnf \
  --grammar '
    root ::= "[" (domain ",")+ domain "]"
    domain ::= "\"" alphanum (alphanum | "-")+ "\""
    alphanum ::= [0-9a-z]
    '
  -p "You are smart and creative domain name generator. Come up with ideas of domain names for website with the following description: \"$2\". Write in response JSON array containing strings of domain names without TLD's." \
  --no-display-prompt \
  --log-disable
