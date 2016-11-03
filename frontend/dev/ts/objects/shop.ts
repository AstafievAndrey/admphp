export class Schedule{
    id:number;
    name: string;
    type_work:string;
    work_begin:string;
    work_end:string;
}

export class Shop{
    id: number;
    enabled:number;
    name: string;
    address:string;
    phone:string;
    site:string;
    inst:string;
    vk:string;
    city_id:number;
    category_id:number;
    short_desc:string;
    desc:string;
    parking:string;
    alcohol:string;
    food:string;
    veranda:string;
    console:string;
    board:string;
    shedule:Schedule[];
    file:FileList;
}