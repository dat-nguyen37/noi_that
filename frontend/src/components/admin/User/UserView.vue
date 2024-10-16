<template>
    <div class=" mt-2">
        <div class="flex items-center gap-2 p-2">
            <router-link :to="{name:'adminHome'}">Home:</router-link>
            <VueIcon type="mdi" :path="mdiChevronRight"/>
            <p class="text-sm">Khách hàng</p>
        </div>
        <div class="flex flex-col bg-white shadow-lg mt-1 p-4">
            <table class="w-full text-xs md:text-sm table-fixed">
                <thead class="border">
                    <tr class="bg-gray-400 text-center">
                        <td scope="col" class="border">Id</td>
                        <td scope="col" class="border">Usname</td>
                        <td scope="col" class="border">Phone</td>
                        <td scope="col" class="border">Email</td>
                        <td scope="col" class="border">Hành động</td>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in data" :key="item.id" class="">
                        <td scope="col" class="border p-2 text-center hover:text-blue-500 cursor-pointer">#{{ item.id }}</td>
                        <td scope="col" class="border text-center">{{ item.username }}</td>
                        <td scope="col" class="border text-center">{{ item.phone }}</td>
                        <td scope="col" class="border text-center">{{ item.email }}</td>
                        <td class="flex gap-2 justify-center items-center border">
                            <div class="text-red-500"><VueIcon type="mdi" :path="mdiCloseCircle"/></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- <div class="absolute bottom-0 right-0">
            <div class="flex gap-2">
                <font-awesome-icon icon="arrow-left" v-if="page>1" @click="prevPage" class="p-2 bg-blue-400 hover:cursor-pointer"/>
                <font-awesome-icon icon="arrow-right" @click="nextPage" class="p-2 bg-blue-400 hover:cursor-pointer"/>
            </div>
        </div> -->
    </div>
</template>
<script>
import { mdiChevronRight,mdiCheckCircle, mdiCloseCircle } from '@mdi/js';
import axios from 'axios';

export default {
    name:'OrderView',
    props:['updateTotal'],
    data(){
        return{
            data:[],
            page:1,
            limit:5,
            mdiChevronRight,mdiCheckCircle,mdiCloseCircle,
        }
    },
    mounted(){
        this.getUser()
    },
    methods:{
        async getUser(){
            try {
                const res=await axios.get(`/User/getByPage?page=${this.page}&limit=${this.limit}`)
                this.data=res.data
            } catch (err) {
                console.log(err)
            }
        },
    },
}
</script>