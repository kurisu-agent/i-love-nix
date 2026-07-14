# The Nix language in 30 seconds — one expression, evaluated to a value.
# It's a function of `name` (with a default), so you can pass a param:
#
#   nix eval -f sample.nix message
#   nix eval -f sample.nix message --argstr name "Alice"
#   nix eval -f sample.nix doubled
{
  name ? "Wonderland",
}:
let
  greeting = n: "Hello, ${n}!";
  numbers = [ 1 2 3 ];
in
{
  message = greeting name;
  doubled = map (x: x * 2) numbers;
  server = {
    port = 443;
    enable = true;
  };
}
