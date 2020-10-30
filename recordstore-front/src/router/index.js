import { createRouter, createWebHistory } from 'vue-router'
import Signin from "@/components/Signin";

const routes = [
  {
    path: "/",
    name: "Signin",
    component: Signin,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
