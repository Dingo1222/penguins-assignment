#clean penguins_raw file to penguins_clean file
cleaning <- function(data){
  data %>%
    select(-starts_with("Delta")) %>%
    select(-Comments) %>%
    clean_names() %>%
    remove_empty(c("rows", "cols"))
}
