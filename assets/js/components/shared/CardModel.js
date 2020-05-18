import React, { useState } from "react";

import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import Button from "@material-ui/core/Button";
import Link from "@material-ui/core/Link";

import getCSRFToken from "../../helpers/getCSRFToken";
import ThemeProvider from "./ThemeProvider";

const csrfToken = getCSRFToken();

function CardModel({ data, path, Form, children }) {
  const [editing, setEditing] = useState(false);

  if (editing) return <Form data={data} onCancel={() => setEditing(false)} />;

  return (
    <ThemeProvider>
      <Card raised>
        <CardActionArea>
          <CardContent>{children}</CardContent>
        </CardActionArea>
        <CardActions>
          <Button color="primary" onClick={() => setEditing(true)}>
            Update
          </Button>
          <Link
            href={`${path}/${data.id}`}
            data-confirm="Are you sure?"
            data-method="delete"
            data-to={`/${path}/${data.id}`}
            data-csrf={csrfToken}
            rel="nofollow"
          >
            <Button color="secondary">Remove</Button>
          </Link>
        </CardActions>
      </Card>
    </ThemeProvider>
  );
}

export default CardModel;
