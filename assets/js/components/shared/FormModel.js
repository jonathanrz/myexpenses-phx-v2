import React from "react";
import { useFormik } from "formik";

import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import Button from "@material-ui/core/Button";
import Link from "@material-ui/core/Link";

import getCSRFToken from "../../helpers/getCSRFToken";

function FormModel({
  data = {},
  onCancel,
  children,
  initialValues,
  validate,
  path,
  model,
}) {
  const formik = useFormik({
    initialValues: initialValues,
    validate,
    onSubmit: (values) => {
      const body = new FormData();

      for (var key in values) {
        body.append(`${model}[${key}]`, values[key]);
      }
      body.append("_csrf_token", getCSRFToken());

      const url = `/${path}${data.id ? "/" + data.id : ""}`;
      const method = data.id ? "PUT" : "POST";

      fetch(url, {
        method,
        body,
        redirect: "manual",
      }).then((response) => {
        if (response.redirected || response.type === "opaqueredirect") {
          window.location.href = path;
        }
      });
    },
  });

  return (
    <form onSubmit={formik.handleSubmit}>
      <Card raised>
        <CardActionArea>
          <CardContent>{children(formik)}</CardContent>
        </CardActionArea>
        <CardActions>
          {onCancel && (
            <Button color="default" onClick={onCancel}>
              Cancel
            </Button>
          )}
          <Link href={`/${path}/${data.id}/edit`}>
            <Button color="secondary" type="submit" variant="contained">
              {data.id ? "Save" : "Create"}
            </Button>
          </Link>
        </CardActions>
      </Card>
    </form>
  );
}

export default FormModel;
