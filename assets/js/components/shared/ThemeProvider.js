import React from "react";
import { createMuiTheme, ThemeProvider } from "@material-ui/core/styles";

const theme = createMuiTheme({
  palette: {
    primary: {
      main: "#2196f3"
    },
    secondary: {
      main: "#ff4081"
    },
    text: {
      primary: "#212121",
      secondary: "#757575",
      divider: "#bdbdbd"
    }
  }
});

function SharedThemeProvider({ children }) {
  return <ThemeProvider theme={theme}>{children}</ThemeProvider>;
}

export default SharedThemeProvider;
