import React from "react";

import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import Typography from "@material-ui/core/Typography";
import Button from "@material-ui/core/Button";
import Link from "@material-ui/core/Link";

import Currency from "../../helpers/currency";
import getCSRFToken from "../../helpers/getCSRFToken";

const csrfToken = getCSRFToken();

const PATH = "accounts";

function AccountCard({ data }) {
  return (
    <Card raised>
      <CardActionArea>
        <CardContent>
          <Typography
            variant="body1"
            color="textPrimary"
            component="p"
            gutterBottom
          >
            <b>Name:</b> {data.name}
          </Typography>
          <Typography variant="body1" color="textSecondary" component="p">
            <b>Balance:</b> {Currency.format(data.balance)}
          </Typography>
        </CardContent>
      </CardActionArea>
      <CardActions>
        <Link href={`/${PATH}/${data.id}/edit`}>
          <Button color="primary">Edit</Button>
        </Link>
        <Link
          href={`${PATH}/${data.id}`}
          data-confirm="Are you sure?"
          data-method="delete"
          data-to={`/${PATH}/${data.id}`}
          data-csrf={csrfToken}
          rel="nofollow"
        >
          <Button color="secondary">Remove</Button>
        </Link>
      </CardActions>
    </Card>
  );
}

export default AccountCard;
