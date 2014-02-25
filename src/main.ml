let () =
  try let o = Syndic.string_of_feed (Syndic.analyze (Xmlm.make_input (`Channel stdin)))
    in print_endline o
  with
    | Syndic.Expected (a, b) -> print_endline (Syndic.string_of_expectation (a, b))
    | Syndic.Malformed_URL e -> print_endline ("Malformed URL: " ^ e)
    | Syndic.Duplicate_Link (a, b) -> print_endline (Syndic.string_of_duplicate_exception (a, b))
    | _ -> print_endline "Unknown error"