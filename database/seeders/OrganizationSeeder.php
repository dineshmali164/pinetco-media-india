<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Organization;
class OrganizationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if(Organization::count() == 0){

            $organizations = [
                [
                    'organization_name' => 'Pinetco India',
                    'created_at' => now()
                ],
                [
                    'organization_name' => 'Pinetco German',
                    'created_at' => now()
                ],
            ];
            Organization::insert($organizations);
        }
    }
}
