local M = {}

-- Quotes table
M.quotes = {
  "Keep pushing forward, no matter what! 🚀",
  "You can do anything you set your mind to. 💪",
  "Believe in yourself. You are unstoppable! ✨",
  "Success is the sum of small efforts, repeated daily. 🌟",
  "Mistakes are proof that you’re trying. Keep going! 🛤️",
}

-- Function to display a random quote
function M.show_quote()
  -- Pick a random quote from the table
  local quote = M.quotes[math.random(#M.quotes)]
  -- Print the quote in the command area
  vim.api.nvim_echo({ { quote, "None" } }, false, {})
end

return M
