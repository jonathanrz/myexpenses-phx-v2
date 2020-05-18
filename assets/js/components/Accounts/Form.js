import React from "react";
import { useFormik } from "formik";

import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import Button from "@material-ui/core/Button";
import Link from "@material-ui/core/Link";

import getCSRFToken from "../../helpers/getCSRFToken";
import FormikTextField from "../shared/form/FormikTextField";
import FormikCurrencyField from "../shared/form/FormikCurrencyField";

const PATH = "accounts";

const validate = (values) => {
  const errors = {};

  if (!values.name) errors.name = "Required";
  if (!values.balance) errors.balance = "Required";

  return errors;
};

function AccountForm({ data = {} }) {
  const formik = useFormik({
    initialValues: {
      name: data.name || "",
      balance: data.balance || 0,
    },
    validate,
    onSubmit: (values) => {
      const body = new FormData();

      for (var key in values) {
        body.append(`account[${key}]`, values[key]);
      }
      body.append("_csrf_token", getCSRFToken());

      const url = `/accounts${data.id ? "/" + data.id : ""}`;
      const method = data.id ? "PUT" : "POST";

      fetch(url, {
        method,
        body,
        redirect: "manual",
      }).then((response) => {
        if (response.redirected || response.type === "opaqueredirect") {
          window.location.href = PATH;
        }
      });
    },
  });

  return (
    <form onSubmit={formik.handleSubmit}>
      <Card raised>
        <CardActionArea>
          <CardContent>
            <FormikTextField name="name" label="Name" formik={formik} />
            <FormikCurrencyField
              name="balance"
              label="Balance"
              formik={formik}
            />
          </CardContent>
        </CardActionArea>
        <CardActions>
          {data.id && (
            <Link href={`/${PATH}`}>
              <Button
                color="default"
                data-csrf={getCSRFToken()}
                data-method="get"
                data-to="/accounts"
              >
                Cancel
              </Button>
            </Link>
          )}
          <Link href={`/${PATH}/${data.id}/edit`}>
            <Button color="secondary" type="submit" variant="contained">
              {data.id ? "Save" : "Create"}
            </Button>
          </Link>
        </CardActions>
      </Card>
    </form>
  );
}

export default AccountForm;
