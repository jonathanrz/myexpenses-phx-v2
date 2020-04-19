import get from "lodash/get";

export const fromTheme = (prop) => ({ theme }) => get(theme, prop);
export const themeColor = (color) => ({ theme }) =>
  get(theme, `palette.${color}`);

export const fromProp = (prop) => (props) => get(props, prop);

export const branch = (prop, left, right = "unset") => (props) =>
  get(props, prop) ? left : right;

export const branchAnd = (propArray, left, right = "unset") => (props) => {
  return propArray.every((p) => get(props, p.trim())) ? left : right;
};

export const ifProp = (prop, value, left, right = "") => (props) =>
  get(props, prop) === value ? left : right;
